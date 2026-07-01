class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.25/husker-v0.4.25-aarch64-apple-darwin.tar.gz"
      sha256 "e6a4adaf4e9fd71aa370b103c0d817fbaef1e10a309858fa3822d9027fbea3f3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.25/husker-v0.4.25-x86_64-apple-darwin.tar.gz"
      sha256 "36a5e469595fdd673aff8f8117f42f0254a60389b9d6de05b3a3b7eedc49259a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.25/husker-v0.4.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1363ce154b83e0b0cc2fc167b35122121a675758ea541a2e385e87f34d72c6ff"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.25/husker-v0.4.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af0189fd40dac959502a5dcc68c20fc10b8b810145c00d4d6b61c30a5fd931f1"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
