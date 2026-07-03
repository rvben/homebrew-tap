class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.35/husker-v0.4.35-aarch64-apple-darwin.tar.gz"
      sha256 "0a387a7ab9dae866bdc78e58edeb87caea5c39bc5eae052b078d9657a1afdb93"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.35/husker-v0.4.35-x86_64-apple-darwin.tar.gz"
      sha256 "602592d3aae6a0616650012cd784a64a2004d679a8b2b6a6398e139ffb95a4ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.35/husker-v0.4.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06a50b3678166726c733b6ca0c5a8cac2ecdd104dd255b7ff8d1b93d7434a1c0"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.35/husker-v0.4.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a99e88b81f7aa7ee578d3a8518fb6884ef376121250a6c559da73b1d179c76a"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
