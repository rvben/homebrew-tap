class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.14/yuki-cli-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "4bbda0a8c01bd755b21f39dc42f765545f8158648136f94c6483f521f76d250a"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.14/yuki-cli-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "40a0a501e0637d1eae4b88953f5dccbded88c1bb00690be470a39c0c19948cb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.14/yuki-cli-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db1097e5a5e3d5e03be5510bbe6b7be7351a19ce109fb3f68abef57bf24680c4"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.14/yuki-cli-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a309b075165cb97bb5bb3aedf806e0ad903c9249c03adb614ab47a8079e8cace"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
