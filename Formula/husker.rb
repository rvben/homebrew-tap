class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.5/husker-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "8e5c020ed644fb1e13b58878f2f128a4af3aca950c94302da34fadd35ad72e32"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.5/husker-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "bcb1fe1e4437a1cb229ec78a79aef8a3af693607be6a60bb70dcb27908b9d6ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.5/husker-v0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5be40e7cb945dc15aee754823f00d49df14bb85dfa825e2cbcdb96986bb40bcb"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.5/husker-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fdacbf00bfc96b2030c8d1be46466f2be63412f6a378daefe3c69b52491bf9ec"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
