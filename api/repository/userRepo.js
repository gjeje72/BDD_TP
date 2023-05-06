import { v4 as uuidv4 } from 'uuid';

export default (User) => {
  let users = [
    new User(
      '6c84fb90-12c4-11e1-840d-7b25c5ee775a',
      'Grollier',
      'Theo',
      '2001-11-04',
      'Rue de la chatterie - 44800 St Herblain',
      '+33606060606',
      'theo.g@gmail.com'
    ),
    new User(
      '31f5df5d-1776-4c5f-af6d-ce473dce3486',
      'Diot',
      'Jeremy',
      '1874-07-23',
      'Rue St Michel - 35000 Rennes',
      '+33606060606',
      'jdiot@hotmail.com'
    )
  ];

  const listUsers = () => {
    return users;
  }

  const findUser = (id) => {
    return users.find((user) => user.id === id);
  }

  const addUser = (user) => {
    let userToCreate = new User(uuidv4(), user.lastName, user.firstName, user.birthDate, user.address, user.phone, user.email);
    users.push(userToCreate);
    return userToCreate;
  }

  const updateUser = (uuid, user) => {
    let userToUpdateIndex = users.findIndex((u) => u.id === uuid);
    if (userToUpdateIndex > -1){
      users[userToUpdateIndex] = Object.assign(users[userToUpdateIndex], user);
      return users[userToUpdateIndex]
    }

    return null;
  }

  const deleteUser = (uuid) => {
    let userToDeleteIndex = users.findIndex((u) => u.id === uuid);
    if(userToDeleteIndex > -1){
      let deleted = users.splice(userToDeleteIndex, 1)[0];
      return deleted;
    }

    return null;
  }

  return {
    listUsers,
    findUser,
    addUser,
    updateUser,
    deleteUser
  }
}