FROM rust:1.67 as builder
WORKDIR /usr/src/RustyAllPurpose
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/all_purpose /usr/local/bin/all_purpose
CMD ["all_purpose"]
