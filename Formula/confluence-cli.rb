class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.30/confluence-cli-v0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "5cf48df4dc663a1d5e5e24040030d496118fd1e4a04d075c5202c8f229778642"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.30/confluence-cli-v0.1.30-x86_64-apple-darwin.tar.gz"
      sha256 "296db9351a3dd4acc78bdc626164d763f8d198934498fbd26e35d5c75bfd1652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.30/confluence-cli-v0.1.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41ece0d195b31c9a755413d3db65207c393e4b8981fb15d99cb1c486f6933c55"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.30/confluence-cli-v0.1.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af188ce5ddff2658278a584a5dce8c9cd08e5d5194f84d35409f7657165c8311"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
