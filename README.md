# Decentralized Parametric Weather Insurance

A smart contract system built on Clarity for the Stacks blockchain that provides automated, parametric weather insurance. This system uses verified weather data to automatically trigger insurance payouts when predefined weather conditions are met.

## Overview

This decentralized insurance platform eliminates the need for manual claims processing by using smart contracts to automate the entire insurance lifecycle:

1. **Weather Data Verification**: Validates meteorological data from trusted oracles
2. **Policy Automation**: Manages the creation and lifecycle of weather insurance policies
3. **Risk Assessment**: Evaluates weather-related risks for different locations
4. **Claim Processing**: Automatically processes claims based on verified weather data
5. **Payout Calculation**: Determines insurance payouts based on policy terms and weather conditions

## Smart Contracts

### Weather Data Verification (`weather-data-verification.clar`)

This contract validates and stores weather data from authorized oracle sources:

- Manages authorized data providers
- Stores verified weather data (temperature, rainfall, wind speed)
- Provides read-only functions to access verified weather data

### Policy Automation (`policy-automation.clar`)

This contract manages the creation and lifecycle of insurance policies:

- Creates new insurance policies with customizable parameters
- Stores policy details including coverage amount, premium, and weather thresholds
- Handles policy cancellation and premium refunds

### Claim Processing (`claim-processing.clar`)

This contract automates the claims process:

- Allows policyholders to file claims
- Verifies claim eligibility based on policy terms and weather data
- Processes approved claims and triggers payouts

### Risk Assessment (`risk-assessment.clar`)

This contract evaluates weather-related risks:

- Stores risk factors for different locations
- Calculates risk scores based on historical and current weather data
- Helps determine appropriate premium and coverage amounts

### Payout Calculation (`payout-calculation.clar`)

This contract determines insurance payouts:

- Calculates payout amounts based on policy terms and verified weather data
- Uses weather thresholds defined in policies to determine if payout conditions are met
- Supports partial payouts based on the severity of weather events

## How It Works

1. **Policy Creation**: Users create insurance policies by specifying:
    - Location to be insured
    - Policy duration (start and end dates)
    - Premium amount
    - Coverage amount
    - Weather thresholds (rainfall, wind speed, temperature)

2. **Weather Data Verification**: Authorized oracles submit weather data which is verified and stored on-chain.

3. **Claim Filing**: When extreme weather occurs, policyholders can file claims.

4. **Automated Processing**: The system:
    - Verifies the policy is active
    - Checks if the weather data meets the threshold conditions
    - Calculates the appropriate payout amount
    - Automatically transfers funds to the policyholder if conditions are met

5. **Risk Assessment**: The system continuously evaluates weather risks to help determine appropriate premiums and coverage amounts for new policies.

## Testing

The project includes comprehensive tests for all contracts using Vitest. Run the tests with:

```
npm test
```

## Future Enhancements

- Multi-signature oracle data verification
- Integration with additional weather data sources
- Dynamic premium calculation based on real-time risk assessment
- Support for more complex weather parameters and conditions
- DAO governance for system parameters and risk models
```

```md project="Weather Insurance" file="PR-DETAILS.md" type="markdown"
# Pull Request: Decentralized Parametric Weather Insurance

## Overview

This PR implements a decentralized parametric weather insurance system using Clarity smart contracts for the Stacks blockchain. The system automates the entire insurance lifecycle from policy creation to claims processing and payouts based on verified weather data.

## Components Implemented

1. **Weather Data Verification Contract**
   - Validates and stores weather data from authorized oracles
   - Implements access control for data submission
   - Provides read functions for verified weather data

2. **Policy Automation Contract**
   - Handles creation of customizable insurance policies
   - Manages policy lifecycle including cancellation
   - Stores policy details and parameters

3. **Claim Processing Contract**
   - Automates the claims filing process
   - Verifies claim eligibility against policy terms
   - Processes approved claims and triggers payouts

4. **Risk Assessment Contract**
   - Stores and updates risk factors for different locations
   - Calculates risk scores based on weather data
   - Provides risk information for premium calculations

5. **Payout Calculation Contract**
   - Determines payout amounts based on policy terms and weather data
   - Implements threshold-based trigger system
   - Supports partial payouts based on severity

## Testing

Comprehensive tests have been implemented using Vitest for all contracts:
- Tests for weather data submission and verification
- Tests for policy creation and management
- Tests for claim processing and payout calculation
- Tests for risk assessment functionality

## Technical Details

- All contracts are implemented in Clarity (.clar)
- No external dependencies on restricted libraries
- Simple, focused contract design with clear separation of concerns
- Contracts interact through well-defined interfaces

## Security Considerations

- Access control implemented for administrative functions
- Validation of all inputs and contract state changes
- Clear error codes for failed operations
- Separation of concerns between contracts for better security

## Next Steps

- Add more comprehensive error handling
- Implement additional weather parameters
- Enhance risk models with more sophisticated algorithms
- Add support for different types of weather insurance products
```

## System Architecture

Here's a diagram showing how the different contracts interact in this decentralized parametric weather insurance system:

```mermaid title="Weather Insurance System Architecture" type="diagram"
graph TD;
    A["Weather Data Verification"]-->B["Policy Automation"]
    A-->C["Claim Processing"]
    A-->D["Risk Assessment"]
    A-->E["Payout Calculation"]
    B-->C
    B-->E
    D-->E
    C-->E
