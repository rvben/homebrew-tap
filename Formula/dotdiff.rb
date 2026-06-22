class Dotdiff < Formula
  desc "Semantic diff for JSON, YAML, TOML, and NDJSON: a structured, agent-friendly change-list instead of line noise."
  homepage "https://github.com/rvben/dotdiff"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "dcc60efbae9a67e28f3afe9dcf86eb316d199e7a9c300616dea3c7ec2bd3187d"
    else
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3c5fb2355f3ba9c5de18377770aa51ef2d31e1baaa063cec74882fe4fef15d9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83dc2cd23d72bf26c92345ae4914f8d570ead6faa78bc8f6f28cb9e6e98b6d11"
    else
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef0b7377f142d732a18b35b2fb8e6d19a55ccfd3ad4d0de21f680daae140bc98"
    end
  end

  def install
    bin.install "dotdiff"
  end

  test do
    system "#{bin}/dotdiff", "--version"
  end
end
