class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.32/confluence-cli-v0.1.32-aarch64-apple-darwin.tar.gz"
      sha256 "8da3a917a0e7bde57271fb245eb43bdda4e844d0462250a082513fbbb2f1916a"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.32/confluence-cli-v0.1.32-x86_64-apple-darwin.tar.gz"
      sha256 "72ce5d6d17276a02d8ea64b5bebbf5a662c992814ddf83d1c5d1a09017ce0faa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.32/confluence-cli-v0.1.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb9f735b70809e39520950abec3964a9a7635a5a519797d14479565f4599366e"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.32/confluence-cli-v0.1.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9ccc53fada175e51de3e355daa2553206fa888415c3189860a4ec7ee5a80d8a"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
