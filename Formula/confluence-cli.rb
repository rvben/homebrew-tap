class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.28/confluence-cli-v0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "334f31d8d5efe3c254bea0723a0e2263ab2ffce55add51aa5a48971ffc16b315"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.28/confluence-cli-v0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "253eb06bfee0fa544f3267b97253cff05232741347bf796c310f9930553430bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.28/confluence-cli-v0.1.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93fde17ef1b792c6ec5cb40af4734f4eeaac4e93488627ea3873c2f42211b841"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.28/confluence-cli-v0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c1772c56351a582e809a61d78e0d1c73baf83a0130446e2b3a81ce09c251ac8"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
