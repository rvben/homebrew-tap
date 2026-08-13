class Dotpick < Formula
  desc "Token-minimal field projection over JSON, YAML, TOML and NDJSON"
  homepage "https://github.com/rvben/dotpick"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotpick/releases/download/v0.1.2/dotpick-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "5267b31bb0a176d14c20e4680286538e96c768ca0155be13acfed7dfafec5bb2"
    else
      url "https://github.com/rvben/dotpick/releases/download/v0.1.2/dotpick-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "d7dd50c97a695e81d9e4bafd78a30998d646d5cfab73a5cfb7779b57bcfe671d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotpick/releases/download/v0.1.2/dotpick-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6cec3fc64cfa2236e69b066574895658bb8f7d745a681c8054b1a1d7f785d40"
    else
      url "https://github.com/rvben/dotpick/releases/download/v0.1.2/dotpick-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ac93e5ae186afb468ab64eedb47d6d10597a04504318f9c6ea4fad561f1cdd1"
    end
  end

  def install
    bin.install "dotpick"
  end

  test do
    system "#{bin}/dotpick", "--version"
  end
end
