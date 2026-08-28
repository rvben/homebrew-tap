class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.23/confluence-cli-v0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "d7e03cd12cf386580f144b9b299a4f729cffa5cf7867659bbb4ab9d7a2a8fd12"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.23/confluence-cli-v0.1.23-x86_64-apple-darwin.tar.gz"
      sha256 "5f741b400e91a8c385d287ae03442d989165780c48afb9b2b6f4acd32eeb4013"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.23/confluence-cli-v0.1.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c614c07e5a93c66746f084d4af270573613f9676c237aa7999ca75447c035836"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.23/confluence-cli-v0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a3de26de6b61a92cc6721e07e9efc3139bdcf4c0dc0e8d097bc4957c8d0fe96"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
