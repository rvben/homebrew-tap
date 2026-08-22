class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.7/jira-cli-v0.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "8f910069e895c7dcd4bf0de20e7c7ff30f9e0438c00888cfda565fd734c15b0e"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.7/jira-cli-v0.4.7-x86_64-apple-darwin.tar.gz"
      sha256 "aed2f1b6ec99f741dc9080074c86069626481c5cad4cd806c589c25359b37c81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.7/jira-cli-v0.4.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc23cf584a9e40a7e2822c4903f98b1fce3fcc68da15e1f3e82efb3394b6ed52"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.7/jira-cli-v0.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "957e83a6dc549f9c05ac9630ac3a7be06524284562339a67777267c848c633a2"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
