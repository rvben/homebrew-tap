class SharepointCli < Formula
  desc "Manage SharePoint sites, libraries, and files"
  homepage "https://github.com/rvben/sharepoint-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.1/sharepoint-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "40b04b2c5bc183dcfa89177e8e3f06c7ffaaf9be624c9b13dd8906bbed21fb8d"
    else
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.1/sharepoint-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "cae653d2af9f19c9758a88a01403153b5c222152a03494e1f8507bf4b57831ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.1/sharepoint-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d43af95fecb0ceb618a0bc962a1df4ff354401f0052425f4d223f87fc795d14d"
    else
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.1/sharepoint-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d348ed38d7661cb82943703aa9acbe452200639967eb8b4d2066eba4ef77182"
    end
  end

  def install
    bin.install "sharepoint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sharepoint --version")
    assert_match "Usage:", shell_output("#{bin}/sharepoint --help")
  end
end
