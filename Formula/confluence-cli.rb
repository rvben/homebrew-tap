class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.31/confluence-cli-v0.1.31-aarch64-apple-darwin.tar.gz"
      sha256 "db7130b5c0e8877eb71d005ff186cbbe870a8df918df49f4ac652e4ec2f0c269"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.31/confluence-cli-v0.1.31-x86_64-apple-darwin.tar.gz"
      sha256 "8eecd11ecfb6451105a01d8ff3fcf1c9aa1977092a10166c0a7a91323b291d2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.31/confluence-cli-v0.1.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c36a04fc9316b8e07e7a2044ff985771b4538adb5fe46b284c67e72476073c6d"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.31/confluence-cli-v0.1.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e82558d25b01579facc9bd93043ae6d3de4bf8283098acbb623952cdc9959e3"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
