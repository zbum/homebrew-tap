class Mc < Formula
  desc "MC - SSH Connection Manager"
  homepage "https://github.com/zbum/mc"
  version "1.2.0"
  license "MIT"  # 실제 라이선스로 변경

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zbum/mc/releases/download/v1.2.0/mc-darwin-arm64"
      sha256 "sha256:dd273d21c5525edebade86c7bbf1d487481db82e1514e04058f373f2888644ec"

      def install
        bin.install "mc-darwin-arm64" => "mc"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/zbum/mc/releases/download/v1.2.0/mc-darwin-amd64"
      sha256 "sha256:5d654e4388e1989677a6201b11cd917dfc8a757f3e303f406b97601a2992c53d"

      def install
        bin.install "mc-darwin-amd64" => "mc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zbum/mc/releases/download/v1.2.0/mc-linux-arm64"
      sha256 "sha256:132e9dfd9d5c5bcbd942f0249ac37e84f852a6e97251452699dbac464b6668e8"

      def install
        bin.install "mc-linux-arm64" => "mc"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/zbum/mc/releases/download/v1.2.0/mc-linux-amd64"
      sha256 "sha256:ebe4253b9d1f4f7ac550eb8eb66df84b2015043ff398d9e4fe5246770d41d3eb"

      def install
        bin.install "mc-linux-amd64" => "mc"
      end
    end
  end

  test do
    system "#{bin}/mc", "--version"
  end
end
