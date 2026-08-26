class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.18/confluence-cli-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "f66b40e33587f402af86f78c77b3fd63af97c1fd05b94cd4fe5b47b057f80511"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.18/confluence-cli-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "cdaa8e86d8f610729e0448d9d011f7b1996caab0a85366f9ec23a694fcf0a053"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/rvben/confluence-cli/releases/download/v0.1.18/confluence-cli-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a900f70e33c7794765ef54ed610c87ac92d311a29a10a57bfd167592093c1850"
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
