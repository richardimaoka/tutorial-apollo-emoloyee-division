import { gql } from "@apollo/client";

export const DivisionCard = (): JSX.Element => {
  return <div></div>;
};

DivisionCard.fragment = gql`
  fragment DivisionCard on Division {
    divisionName
  }
`;
