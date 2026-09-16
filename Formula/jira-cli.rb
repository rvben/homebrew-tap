class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.10/jira-cli-v0.4.10-aarch64-apple-darwin.tar.gz"
      sha256 "730c6bb7b3df774694537f1f581529bac352ea0618877bc101a1400c3e5d8e82"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.10/jira-cli-v0.4.10-x86_64-apple-darwin.tar.gz"
      sha256 "1531fbd6c10e39936d847a6d6b21c8f8064cacdbb29c8ba00d105d5daa95d922"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.10/jira-cli-v0.4.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a61f54e71f7bf750c94f18453851d032d1bb32ac19d878c7fa2434ce8f4af557"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.10/jira-cli-v0.4.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a94fd02d076e3d29b85b18035b0776e002338e3dd6371a01fe4ceb05c1c343d2"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
