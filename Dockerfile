FROM rust:1.67 as builder
WORKDIR /usr/src/RustyAllPurpose
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/RustyAllPurpose /usr/local/bin/RustyAllPurpose
CMD ["all_purpose"]