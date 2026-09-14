class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with native and QEMU backends"
  homepage "https://github.com/rvben/esprite"
  version "0.5.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/rvben/esprite/releases/download/v0.5.0/esprite-0.5.0-darwin-arm64.tar.gz"
      sha256 "ded15b73aaaed8adaa8fa3c97c00a6dc85118dc5c953db0c42405787a7afd7c7"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/rvben/esprite/releases/download/v0.5.0/esprite-0.5.0-linux-x86_64.tar.gz"
      sha256 "33e5f6d9f9d6dd634f400f2a189786c886474896a8d5145d5fb71444afe48ea1"
    end
  end

  def install
    bin.install "esprite"
    pkgshare.install "examples/html-studio"
  end

  def caveats
    <<~EOS
      Launch the optional HTML studio with Python 3.9+:
        python3 #{opt_pkgshare}/html-studio/server.py --runner #{opt_bin}/esprite --target cyd
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/esprite --version")
    assert_path_exists pkgshare/"html-studio/server.py"
    assert_path_exists pkgshare/"html-studio/index.html"
  end
end
