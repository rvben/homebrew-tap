class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.41/husker-v0.4.41-aarch64-apple-darwin.tar.gz"
      sha256 "05ddecfc713d31802bc552a23363d812392c1d6bc0fe89bebdfe7a2e89d30dab"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.41/husker-v0.4.41-x86_64-apple-darwin.tar.gz"
      sha256 "f362567cbd45b51fe35d4c47a592c784a3868ec619b7bf8e0b500e36089623d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.41/husker-v0.4.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b91569da252efece843dbc39c92c426829c4daea9e1685820e129f97a18eafb"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.41/husker-v0.4.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c2b2b05cd549c4de81670c4fade274d39ddf53ad3be9eb1907d19edec5cbec8"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
