class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.21/confluence-cli-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "5c371b5a760ffc1f0c3301a22a0dfa6ccd1a50cd06d0acb8d95442ede5aa439e"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.21/confluence-cli-v0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "f5713b74f1ebcea69b2ff5b021aadd99cdf7b82df3c68ce15e7e7bd4691c7ff2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.21/confluence-cli-v0.1.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29dabf2f67e36c3ca9c404399838b685923379e4c70cfdb29c593b11c3ce9fea"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.21/confluence-cli-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9edee6a1cb87b6bebf70f8f5616d694d99c42fda644bbcd98d5dda866a870df"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
