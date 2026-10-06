class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.37/confluence-cli-v0.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "1a219bf701ccd4d04bea959449956d534989259f257dae6f62b041598ecf5ee4"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.37/confluence-cli-v0.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "90492d4c8fc98cbb040794183bb762d4a408fd7d44e34a3d865f7a01b9bda660"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.37/confluence-cli-v0.1.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc488620486f153925f7dda1467dd4da785aa9930e33517fef991488588dd50c"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.37/confluence-cli-v0.1.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a5df161d8bdfee0bfe474a0ad33a2ffee25e1b3fb7e08ecc5d6c435b6853938"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
