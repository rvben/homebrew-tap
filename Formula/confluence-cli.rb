class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v#{version}/confluence-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9c3527f06d9f4ae0b9c0f1d86561ab36142bb691075d0b56791a2b2d83e9ca5c"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v#{version}/confluence-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "45876c5b4e38d542ee0c79cc638e9663b1edfcc791b60d4ac40e2a49414e9d8f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v#{version}/confluence-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7ac0fd979299eadb5cc2ceaa66ad3ec4df952a3bec02e37bb0a61f785a6fc0b"
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
