class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.3/confluence-cli-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "660065ee706c93ded24818cd58cf8ea7b0079e022ad6faf81e8b7fff9b022b70"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.3/confluence-cli-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "0372e18c335ba5bcdef1849ed9e9f1b75a65102da9175c32098291867c77ff0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.3/confluence-cli-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f570c0dfb8db3bdaa3ada474d4f8de9102d0f16121271a236825b007a651a13"
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
