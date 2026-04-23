class Nexus3Cli < Formula
  desc "CLI for managing Docker images in Sonatype Nexus Repository 3"
  homepage "https://github.com/zbum/nexus3-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zbum/nexus3-cli/releases/download/v#{version}/nexus3-cli-darwin-arm64.tar.gz"
      sha256 "1231791b8b93fad68a866bbc859c3aad66950d2592f259a3955042ae7138880c"
    else
      url "https://github.com/zbum/nexus3-cli/releases/download/v#{version}/nexus3-cli-darwin-amd64.tar.gz"
      sha256 "d823c753555e763935c876930bb0ce09a40911579a31f87754ba1350df19861e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zbum/nexus3-cli/releases/download/v#{version}/nexus3-cli-linux-arm64.tar.gz"
      sha256 "8ca3fb5c73130b976a7d218ef6c5fadf656b9c782c1bc9dc8df9ce0d8a8d3129"
    else
      url "https://github.com/zbum/nexus3-cli/releases/download/v#{version}/nexus3-cli-linux-amd64.tar.gz"
      sha256 "67bc5fc608f72825bc0a703f480abfe24533efe8242143ea08b45b38fa4a1cfb"
    end
  end

  def install
    bin.install "nexus3-cli"
  end

  test do
    assert_match "nexus3-cli", shell_output("#{bin}/nexus3-cli --version")
  end
end
