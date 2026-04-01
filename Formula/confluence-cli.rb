class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.4/confluence-cli-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "9e8bc808b4af00965c5a6525071af1a161dd68b5211c62abc6a659c7d234dc71"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.4/confluence-cli-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "8d3b9c8ea71d46e1c45116a4e53fa9bddb8504e54438b8f257c6ce1278fae279"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.4/confluence-cli-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41ca1858af5c08c11d0a3f91efa5514211d27d017d055789febcbbb4b83a632f"
    else
      odie "Linux ARM is not supported by this formula."
    end
  end

  def install
    bin.install "confluence-cli"
  end

  test do
    assert_match "confluence-cli #{version}", shell_output("#{bin}/confluence-cli --version")
  end
end
