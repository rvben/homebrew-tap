class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.6/yuki-cli-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "806443ddef4df6bb452a09e05a6aaa0a4cc5b06bc72f7d341d367ba372b7aa80"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.6/yuki-cli-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "f3d6dc6cb979e0277e3398d52080e8b36ab249b956b0185beedcc1b1768a924a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.6/yuki-cli-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a18cd571fffbfff9452253dba4a138491d0a9643ce5603e566eb0167a5c48d60"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.6/yuki-cli-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2684fecb343a48562f637b6d003406cea5b1c2d94a92634bff98a62459e40805"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
