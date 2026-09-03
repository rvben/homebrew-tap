class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.12/yuki-cli-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "b203bb9a67646dc293a251d9f1bcf93f03eecce7906abef91d19a08a77273bf4"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.12/yuki-cli-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "735f1ea5813ba1783de51d28dde671bc1ef39bc97a2f040212f6d415e0adc17c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.12/yuki-cli-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a951d4b8d60c82c892d62d4403f0db88c60a4815f794f32c083ecf1c335a88be"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.12/yuki-cli-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0175d1fa4b44a6e37625bf3a55b13d3f386d396a91f4be2c08d735ac0356e09d"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
