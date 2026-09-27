class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.17/jira-cli-v0.4.17-aarch64-apple-darwin.tar.gz"
      sha256 "f887af9561fa19daa7eed2f101696c08a4158e0d8099456a184541569cac7b23"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.17/jira-cli-v0.4.17-x86_64-apple-darwin.tar.gz"
      sha256 "a359675253bcc1646f2fa9c52b55852987e51108275a2aa070574c60a1b57c1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.17/jira-cli-v0.4.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06e0d600ca18207bf1ed0390548ef8615544b7685f6c4a024f762c9528d8b3a6"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.17/jira-cli-v0.4.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d68dbe81bff42ca36c7beb9a78e9b5927ea52c8dc58626ffd77be69c25ab5393"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
