class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.12/jira-cli-v0.4.12-aarch64-apple-darwin.tar.gz"
      sha256 "364009bc0cabd466f7909a52fc46a8ea315b628f9303d9e732e5be72d7ff1c33"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.12/jira-cli-v0.4.12-x86_64-apple-darwin.tar.gz"
      sha256 "012c88bdcbb3e000d04996cced0199d7a5397baa1dcdd518914e7f1904bf4927"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.12/jira-cli-v0.4.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a063c6f101e8e7864973e628ebdb6c4a49e6782ade3c43655a0f31ec61f75204"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.12/jira-cli-v0.4.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c7c4d067b8c69b7de6c078a4b2ca7df00a1cbd993c407383b6e9ab392eef02f"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
