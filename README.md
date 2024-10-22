# Shy Girl

## Overview

**Shy Girl** is an **offensive security script** developed in **2013** using **shell scripting languages**. It automates **information gathering** from a given domain, making it a useful tool for **penetration testing**. Although the project is now retired, it remains available for educational purposes as an example of automating domain analysis for security professionals.

> **⚠️ This project is retired. I no longer support or commit any changes to it. It is solely for educational purposes.**

## Features at a Glance

- 🔄 **Automated Information Gathering**: Consolidates multiple information-gathering tools into a single script, streamlining the data collection process.
- 🌐 **Domain Analysis**: Gathers comprehensive data from target domains to assist in penetration testing tasks.
- 💻 **Compatibility**: Designed to function on **Backtrack5 R3**, ensuring proper operation with this security-focused OS.

## Project Components

- **Core Script**: Automates the process of gathering essential information from specified domains, integrating various tools into a single script.

## Achievements

- **Efficiency**: Streamlined information gathering for penetration testers, reducing manual work and time consumption.
- **Comprehensive Data Collection**: Ensured thorough data collection from target domains, enabling a more detailed vulnerability analysis.

---

## Why Choose Shy Girl?

Shy Girl v0.3 enhances penetration testing by:
- 💻 **Automating the information-gathering process**, allowing professionals to focus on analyzing vulnerabilities.
- 🌍 **Providing a comprehensive dataset** from target domains, improving the accuracy and efficiency of penetration testing.

Although Shy Girl is now retired, it serves as a valuable example of how automation can be effectively utilized in offensive security operations.

---

## Usage:)-

usage: $. runme.sh [-s][-b][-p seconds] [-d domain name]
        
Example(1) get info for the domain myexample.com but do not pause or stop between tasks and redirect all outputs to a file called results.txt
$. runme.sh -d myexample.com >> results.txt
		
Example(2) get info for the domain myexample.com and stop between tasks 
$. runme.sh -s -d myexample.com 
		
Example(3) get info for the domain myexample.com and pause for 10 seconds between tasks 
$. runme.sh -p 10 -d myexample.com
		
Example(4) get info for the domain myexample.com and pause for 15 seconds and stop between tasks 
$. runme.sh -s -p 15 -d myexample.com

Example(5) get info for the domain myexample.com and pause for 4 seconds and stop between tasks + beep sound when a task is completed
$. runme.sh -s -b -p 4 -d myexample.com 

---
## Usage Disclaimer

Shy Girl was created as a **proof of concept** and is shared solely for **educational purposes**. I take no responsibility for any misuse of this tool. Always use responsibly and only in **authorized environments** with proper permissions.

---

## Licensing

Shy Girl is licensed under the **MIT License** for non-commercial purposes. Credit must be given to me as the original author. For commercial use, please contact me for a commercial license.

For more details, see the [MIT License](https://opensource.org/licenses/MIT).

---

## Contact & Support

For any inquiries or licensing requests, feel free to contact:

- **Website**: [Digi77](https://www.digi77.com)
- **GitHub**: [WMAL](https://github.com/WMAL)
- **Twitter**: [@warith2020](https://twitter.com/warith2020)
- **LinkedIn**: [Warith Al Maawali](https://www.linkedin.com/in/warith1977)

---

© 2024 by Warith AL Maawali, Sultanate of Oman, Muscat. All rights reserved.
