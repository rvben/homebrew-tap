class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.15/jira-cli-v0.3.15-aarch64-apple-darwin.tar.gz"
      sha256 "e6a833e035dd6d188843cd4d4693771d5db7245d50333bf3d6b7ba22cbf66211"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.15/jira-cli-v0.3.15-x86_64-apple-darwin.tar.gz"
      sha256 "8dd11d6c8a8c120e43dea3a33e2992daf1f1042441ffb0ff01b293ca0f532985"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.15/jira-cli-v0.3.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f17646b8837f68089a8b0f78181fcf1d82b519425174300aa59ce1ddaa5638f5"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.15/jira-cli-v0.3.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7432d4d0b67b41bd3f1cfe8b08c00002219abc938ce7ddc65c4d27c128509044"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
