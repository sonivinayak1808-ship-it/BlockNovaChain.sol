// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title BlockNovaChain
 * @dev A decentralized ledger for recording and verifying data entries.
 *      Each record is immutable and timestamped, providing transparency and integrity.
 */

contract BlockNovaChain {
    struct Record {
        address creator;
        uint256 timestamp;
        string data;
    }
contract BlockNovaChain {
    struct Record {
        address creator;
        uint256 timestamp;
        string data;
    }

    mapping(uint256 => Record) private records;
    uint256 public recordCount;

    event RecordCreated(uint256 indexed recordId, address indexed creator, string data, uint256 timestamp);

    /**
     * @dev Create a new record with a data string.
     * @param data The information to be stored.
     */
    function createRecord(string memory data) public {
        recordCount++;
        records[recordCount] = Record(msg.sender, block.timestamp, data);
        emit RecordCreated(recordCount, msg.sender, data, block.timestamp);
    }

    /**
     * @dev Retrieve a specific record by ID.
     * @param recordId The ID of the record.
     * @return creator Address of record creator.
     * @return timestamp Record creation time.
     * @return data The stored data.
     */
    function getRecord(uint256 recordId)
        public
        view
        returns (address creator, uint256 timestamp, string memory data)
    {
        require(recordId > 0 && recordId <= recordCount, "Invalid record ID");
        Record memory r = records[recordId];
        return (r.creator, r.timestamp, r.data);
    }

    /**
     * @dev Get the total number of records.
     * @return count The total count of stored records.
     */
    function getTotalRecords() public view returns (uint256 count) {
        return recordCount;
    }
}



