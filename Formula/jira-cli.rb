class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.14/jira-cli-v0.4.14-aarch64-apple-darwin.tar.gz"
      sha256 "53dd3bc3c528ab1866dd8b6ca66fa8e18f63e7c9c528cbac69887e435856a12d"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.14/jira-cli-v0.4.14-x86_64-apple-darwin.tar.gz"
      sha256 "3d815d47d848fe9eb7247903fcd2b2add7c437f08ee998c668132f5467fcbbcf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.14/jira-cli-v0.4.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "378c1d521a5773e4754881f60c8287dd8a6d2d66bcfc36a4737b08dc1db0dcc3"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.14/jira-cli-v0.4.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77803164a5c4be56f251a898580d54d19c3b2237a07a0abefbbb9143d8c0874f"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
