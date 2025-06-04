;; Weather Data Verification Contract
;; This contract validates meteorological data from oracle sources

(define-data-var authorized-oracle principal tx-sender)
(define-map weather-data
  { location: (string-ascii 64), timestamp: uint }
  { temperature: int, rainfall: uint, wind-speed: uint, verified: bool }
)

;; Set the authorized oracle that can submit weather data
(define-public (set-authorized-oracle (new-oracle principal))
  (begin
    (asserts! (is-eq tx-sender (var-get authorized-oracle)) (err u1))
    (var-set authorized-oracle new-oracle)
    (ok true)
  )
)

;; Submit weather data from an authorized oracle
(define-public (submit-weather-data
                (location (string-ascii 64))
                (timestamp uint)
                (temperature int)
                (rainfall uint)
                (wind-speed uint))
  (begin
    (asserts! (is-eq tx-sender (var-get authorized-oracle)) (err u2))
    (map-set weather-data
      { location: location, timestamp: timestamp }
      { temperature: temperature, rainfall: rainfall, wind-speed: wind-speed, verified: true }
    )
    (ok true)
  )
)

;; Get weather data for a specific location and time
(define-read-only (get-weather-data (location (string-ascii 64)) (timestamp uint))
  (default-to
    { temperature: 0, rainfall: u0, wind-speed: u0, verified: false }
    (map-get? weather-data { location: location, timestamp: timestamp })
  )
)

;; Check if weather data is verified
(define-read-only (is-data-verified (location (string-ascii 64)) (timestamp uint))
  (get verified (get-weather-data location timestamp))
)
