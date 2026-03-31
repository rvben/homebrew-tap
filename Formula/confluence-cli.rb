class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.2/confluence-cli-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "75e43139aeef0a343c156d575cfecc7184abcb1a3d8e48459c9156f6714fdb25"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.2/confluence-cli-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "33b9e151ce29640d21b025705f3f03c3db1fbb6c6d6848a89c2a28d6377da2be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.2/confluence-cli-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f728d831c57bff515cb85d3ea29e90b2fd2238bc78da00d642d1fbb71c05377c"
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
