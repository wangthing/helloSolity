async function main() {
    const MyContract = await ethers.getContractFactory("OpCountBridge");
    const myContract = await MyContract.deploy('0x6EDCE65403992e310A62460808c4b910D972f10f', '40161', '0xa1A528aD33017276ea65a144705F0e4e739198Ca');

    await myContract.deployed();

    console.log("MyContract deployed to:", myContract.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

