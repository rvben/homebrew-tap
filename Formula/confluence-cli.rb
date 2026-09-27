class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.33/confluence-cli-v0.1.33-aarch64-apple-darwin.tar.gz"
      sha256 "2d91c7042db37b8a8129bdc8925b73bb0ca3715e808f955359e328f4fb67ddb9"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.33/confluence-cli-v0.1.33-x86_64-apple-darwin.tar.gz"
      sha256 "679d229073c0a50afba1e83a8a37eb885fa576774f6161d31db7c2aacb7897ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.33/confluence-cli-v0.1.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43173788f9a88f9e99795fd23f727cc494d4cbce33c7b017ae748f23a0dd4488"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.33/confluence-cli-v0.1.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eedde121b7a2146bb8aa850ca7eb20f138b355ac4ebd2ee3ce88e00b1066abf0"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
