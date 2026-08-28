class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.20/confluence-cli-v0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "7bb1d91538f1fd7d8193ad0457c858cfc71881c150f8a00b7830cbc3cf92c93a"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.20/confluence-cli-v0.1.20-x86_64-apple-darwin.tar.gz"
      sha256 "7bc9e28e460ab293585c1d679c44259feb4e57956db6ec25f3ada9cd81959e66"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/rvben/confluence-cli/releases/download/v0.1.20/confluence-cli-v0.1.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "deb5d07fda984d4b9ba263132b66ecd5168d3008eddcdae71144fb72c03fda60"
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
