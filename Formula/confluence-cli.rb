class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.13/confluence-cli-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "083c35d3e784af23772d536bd911c742b0cb07c42fd0cf45998469166e7b4ec5"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.13/confluence-cli-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "a510a5980c20e971f21374271f4fea4c2de6c77d35a67cf76d7ec0324d0736f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.13/confluence-cli-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1807ba56a40ad89fcad46744ac1fa6327c661d8862417f030895e25df4c77554"
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
