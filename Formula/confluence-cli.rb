class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.7/confluence-cli-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "4a7e599b5ff22bb91d6cf3dc5d131956362b22a39d815bf6920afac5353073d9"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.7/confluence-cli-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "772b6606993e65c099ad558aa2face33a6e2d4576703611aff18fec8cc506040"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.7/confluence-cli-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a65fbbd712a1ca2d1726c9af3ea9081bb30a78839acb7499e1b5b6466fc9e2b"
    else
      odie "Linux ARM is not supported by this formula."
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
