class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.2/jira-cli-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "c94b2490df7e3a6fe58c28a5f6bc155ff184b67618986f2d810b742a78fb2c39"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.2/jira-cli-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "ad6a056496639b3dbd6799deea253a068437b828c38a87236c9319f68dccba8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.2/jira-cli-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc4d6294d7519a076e01cb224fb8bc5289465bb29c94ee6a64a1ce946ecd5e1c"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.2/jira-cli-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "784c68c04c2e5d8a824d4f4cab70fb4b441646420d7123ff16538e2aa34303cc"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
