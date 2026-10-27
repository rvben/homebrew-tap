class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.54/husker-v0.4.54-aarch64-apple-darwin.tar.gz"
      sha256 "fb658dc66626659c85dcee28d0529c237af7c2429e24401feb5e15c54959e53a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.54/husker-v0.4.54-x86_64-apple-darwin.tar.gz"
      sha256 "793a5da63cab2086ff63c3c616076884f2076f23fdb62f069782f0c7fedcc21e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.54/husker-v0.4.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0778b9c234d6f2ab8568af7b143e36b48cd74ddec933265fe54d91621d90f09"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.54/husker-v0.4.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09dae8811be534651e64aeff89281cb4acf3c5c6fee24628ff7f2d32583a70ce"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
