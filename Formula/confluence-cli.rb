class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.40/confluence-cli-v0.1.40-aarch64-apple-darwin.tar.gz"
      sha256 "946895f04968bda10e46bd7e504e3bef7940579b59ff001220d6e032283e7910"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.40/confluence-cli-v0.1.40-x86_64-apple-darwin.tar.gz"
      sha256 "4be842191e76e0f18b9e8a77096d67d1b7a14946d7f389e55d17af43a1508721"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.40/confluence-cli-v0.1.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db350cda79c31fa54e0c746902e7ed42330ee5171334c1762eb2347d2a444b2a"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.40/confluence-cli-v0.1.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51395ed3c1d67f704ff6c941a29092dd6aa85a4c9910ca3b00cdd1d4c1592d6a"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
