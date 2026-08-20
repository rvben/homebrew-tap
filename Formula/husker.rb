class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.45/husker-v0.4.45-aarch64-apple-darwin.tar.gz"
      sha256 "66bfe9ec05aecd45f4942ed23f10feb8a50fcf77330dfc59b0c082f13cf02ecc"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.45/husker-v0.4.45-x86_64-apple-darwin.tar.gz"
      sha256 "05497ae6e6070dda0768a19e70d44ad5561f3da9300a236b1d9eccd5c2f29774"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.45/husker-v0.4.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8809cfce438941d11cc1e13510f6b7df6b1d55541b960350430ff9ca7ac31118"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.45/husker-v0.4.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cc85f3431208ec5160f3ca467d5ab800c82ffe718aed6148bec671dd707da80"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
