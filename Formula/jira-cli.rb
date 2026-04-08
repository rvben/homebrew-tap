class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.9/jira-cli-v0.3.9-aarch64-apple-darwin.tar.gz"
      sha256 "915a324f7b3a3c49aad53ed3d35607fd99d9cfc0d9ead67f02da93bf5aa4b8b2"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.9/jira-cli-v0.3.9-x86_64-apple-darwin.tar.gz"
      sha256 "0098b784e34c890d22e832988369a40e6b77178564248e1685377a1f222455ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.9/jira-cli-v0.3.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd076377e0cfb383bd3664b3cd04fb960488002652c18afa054fc9537fc9af5a"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.9/jira-cli-v0.3.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f22885f7f1fa14fd54a6c2fa2c8fad7624db18083e47d036db4092799ebe59c"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
