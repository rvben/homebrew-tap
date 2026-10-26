class ShinyliveCheck < Formula
  include Language::Python::Virtualenv

  desc "Smoke-check exported Shinylive sites in headless Chromium"
  homepage "https://github.com/rvben/shinylive-check"
  url "https://files.pythonhosted.org/packages/00/e3/c2fb65ec7ee08ccc98b6b9d1de8565d4864d639898aa774bbb1cd115d4ad/shinylive_check-0.2.0.tar.gz"
  sha256 "96d9cec17140c73ea49874bf4ff2b75f0fb72c7efe24165f9aa434ee03890ecf"
  license "MIT"

  depends_on "python@3.14"

  resource "greenlet" do
    url "https://files.pythonhosted.org/packages/3e/6e/0091f175ccd02b02bc8811bbcbcc6ac2e980be116e3b2f7a736ca322bf84/greenlet-3.5.6.tar.gz"
    sha256 "8e67c43bdfc88d5fee6db0d3e40175b362fc95fb85f0412d233b9b203c53a575"
  end

  resource "pyee" do
    url "https://files.pythonhosted.org/packages/1d/f1/fdedc2c75c3e31a330659c85e5793bb18b3397981fbf0844c6dee5b18926/pyee-14.0.0.tar.gz"
    sha256 "76dd0f4314ecd27f02dc73589dea7fd3853f9b6176d8ef9b122860657e3602de"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "playwright" do
    version "1.64.1"

    on_macos do
      if Hardware::CPU.arm?
        url "https://files.pythonhosted.org/packages/72/4f/572bbbe60a5787ca61a84bad934c3ce19c08c2bc9c0e9781bf0d99cad1a6/playwright-1.64.1-py3-none-macosx_11_0_arm64.whl", using: :nounzip
        sha256 "59f7b041284ce8d1b72098ae50ca48a2d83692eec25154ab5ba79d4b6b4fe8a9"
      else
        url "https://files.pythonhosted.org/packages/8d/c8/cc677856d89a0c077673b40ab915ed5597bf1347b205cabe70121c431ca9/playwright-1.64.1-py3-none-macosx_10_13_x86_64.whl", using: :nounzip
        sha256 "29453ff76e25c17d0b45658cacd6b92e9eec46e8db21e134fb3b7143df50f013"
      end
    end
    on_linux do
      if Hardware::CPU.arm?
        url "https://files.pythonhosted.org/packages/0c/11/545f25e47ec54e1e8a2892ef9994fc2b298f909ab37b88578e3a1f87ac2e/playwright-1.64.1-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", using: :nounzip
        sha256 "a29fda44725e11b0b625c4bff6458a1f6dbee97b88c9788d12e18a8344458c2d"
      else
        url "https://files.pythonhosted.org/packages/15/b9/e481a34572933b5cf179d5637c98da488c732ee339dff5b73a0624d2e42b/playwright-1.64.1-py3-none-manylinux1_x86_64.whl", using: :nounzip
        sha256 "577b8d88778c245cfbd145ae17cf53044f084b1b46c55c69081d4069d56057e2"
      end
    end
  end

  def install
    venv = virtualenv_create(libexec, "python3.14", system_site_packages: false)
    resources.reject { |r| r.name == "playwright" }.each { |r| venv.pip_install r }
    resource("playwright").stage do
      venv.pip_install Dir["*.whl"].fetch(0)
    end
    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      Install Chromium once for your user account:
        #{opt_libexec}/bin/playwright install chromium
      Repeat this after upgrades that change the Playwright version.
      On Linux, Chromium also needs system libraries; see Playwright's Linux setup guide.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shinylive-check --version")
    assert_match "usage:", shell_output("#{bin}/shinylive-check --help")
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "pip",
           "--python=#{libexec}/bin/python", "check"
    assert_match "Version #{resource("playwright").version}",
                 shell_output("#{libexec}/bin/playwright --version")
    system libexec/"bin/python", "-c", <<~PYTHON
      from playwright.sync_api import sync_playwright
      with sync_playwright() as driver:
          assert driver.chromium.name == "chromium"
    PYTHON
  end
end
