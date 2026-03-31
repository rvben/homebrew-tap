class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.1/confluence-cli-vVERSION_PLACEHOLDER-aarch64-apple-darwin.tar.gz"
      sha256 "e5d2d4a6ce3b1053135d85060859578bd2873e4cd1725e7a72c558e39190983e"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.1/confluence-cli-vVERSION_PLACEHOLDER-x86_64-apple-darwin.tar.gz"
      sha256 "2d9bda6d0de71311e1b728243cf5f1b2f4392813a5117dcb6a12708efeb965b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.1/confluence-cli-vVERSION_PLACEHOLDER-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99ec24cea019704d725445b0216d93aacf8393546a022df06986f47b0dc4041d"
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
