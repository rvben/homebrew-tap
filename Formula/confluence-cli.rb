class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.9/confluence-cli-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "599aad7650a4296cef8b27be5752b66d3580ba8e56db47704cb62c13c77ce252"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.9/confluence-cli-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "ada0a8aafcc002164414db7c237b8ba2d9a292166768b7d26721b74353d307ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.9/confluence-cli-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c026fc26581f4a00555f50a82482996934b4a67912ee37b1bdec8110099fa5c8"
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
