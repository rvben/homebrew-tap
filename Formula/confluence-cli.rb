class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.22/confluence-cli-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "ac6a322195d6c93afde0e1710b35d3c200d6b151429e0eef98c48d498515b02e"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.22/confluence-cli-v0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "107fda99419c31f54b8f45d169c0492a2e36c1a145ddcff1df6c69d8377cfcf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.22/confluence-cli-v0.1.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7920eb1c15f2caa24bce993fd234a8ea25623cc8e71eade15a33718ba993616e"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.22/confluence-cli-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a362e7b0acec5837a1ee6d2e9212efee3c88b968b9abbf77617692a6589aed1c"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
