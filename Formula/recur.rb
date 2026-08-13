class Recur < Formula
  desc "A human-friendly cron job manager"
  homepage "https://github.com/rvben/recur"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/recur/releases/download/v0.1.2/recur-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "026d70c02a73e31901f8fdb0daeec5e5c2ddff344b15fe20a6e598038b0bb722"
    else
      url "https://github.com/rvben/recur/releases/download/v0.1.2/recur-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "788ea62089f39ce3a350c0b0cd7488ed89e53609d88dd54b1dfbc0e5fd6086e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/recur/releases/download/v0.1.2/recur-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f98c36c0cc3ff66a3147dcb893420fc41b60ceb058183f3eeb05aa57772d93eb"
    else
      url "https://github.com/rvben/recur/releases/download/v0.1.2/recur-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f59a55215e200678f39ae7ec391ffe46a62f152c45f2c0dcf17276ccf788ac4a"
    end
  end

  def install
    bin.install "recur"
  end

  test do
    system "#{bin}/recur", "--version"
  end
end
