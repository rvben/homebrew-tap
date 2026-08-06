class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.17/vership-v0.5.17-aarch64-apple-darwin.tar.gz"
      sha256 "e09a7232282371fd1c65fa81322435d821d4595576930d3bb8221a05d6282ba4"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.17/vership-v0.5.17-x86_64-apple-darwin.tar.gz"
      sha256 "ad6ab560880e5be4f4610d2168d572e8f419dea285fbdbfb7b0051f82f6f1a7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.17/vership-v0.5.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63530307b8dc7faaaaa2856e1d0c12a1ea9b4701d3577b51f884a3d2ffffe4e9"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.17/vership-v0.5.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79537261c50f0eb7e228088f95c9f132a1dd9eb6978106b27480044ca45e2728"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
