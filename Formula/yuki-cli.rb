class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.5/yuki-cli-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "a261ebf22c25eed25c0c2284aca4aa3893f841e30ad7bc9ca55dac215ae42b82"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.5/yuki-cli-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "e730e5ace58b2cfab9c7e400af4e5d77d483e4b24a8fb4893665a50b7e964713"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.5/yuki-cli-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7ecd7c3a5af18b399668ffcf6193931f1d2c5880e68404f39af5b0acc07568e"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.5/yuki-cli-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a2c14f3575c5d05e6cbe90e2196190091a6da630288660f5a31bcb54b108895"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
