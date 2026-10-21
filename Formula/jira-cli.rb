class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.20/jira-cli-v0.4.20-aarch64-apple-darwin.tar.gz"
      sha256 "45b97f379f99702072bc75f40c4b4ea595741cb2b83d961d713888ffbb3e2b0f"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.20/jira-cli-v0.4.20-x86_64-apple-darwin.tar.gz"
      sha256 "b2cea808fa3875b0a01cfe3303b694b8068b2e0983555641bcc3eba72c762260"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.20/jira-cli-v0.4.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5e33e2e9eac0950bf7750aa17bb8c131c05f286fd63c28dcdd30bfc7682b4ac"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.20/jira-cli-v0.4.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f9134784390dbe936b87e92c4a25c71e00066ce74bc39e6a50f67d595c2ee23"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
